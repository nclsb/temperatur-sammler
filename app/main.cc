#include <stdio.h>
#include <modbus.h>

int main()
{
    modbus_t *ctx;
    modbus_mapping_t *mb_mapping;
    int sock, len, ret;
    uint8_t *req;

    ctx = modbus_new_tcp("127.0.0.1", 1502);
    if (ctx == NULL)
    {
        fprintf(stderr, "Unable to allocate libmodbus context\n");
        return -1;
    }

    mb_mapping = modbus_mapping_new(0, 0, 1, 0);
    if(mb_mapping == NULL)
    {
        fprintf(stderr, "Failed to allocate mapping\n");
        modbus_free(ctx);
        return -1;
    }
    
    sock = modbus_tcp_listen(ctx, 1);
    if(sock == -1)
    {
        fprintf(stderr, "Listening failed\n");
        return -1;
    } else
    {
        printf("Listening, Socket %d\n", sock);
    }

    sock = modbus_tcp_accept(ctx, &sock);
    if(sock == -1)
    {
        fprintf(stderr, "Accepting failed\n");
        return -1;
    } else
    {
        printf("Accepted, Socket: %d\n", sock);
    }

    for(;;)
    {
        do
        {
            len = modbus_receive(ctx, req);
        } while(len == 0);
        printf("Received\n");

        ret = modbus_reply(ctx, req, len, mb_mapping);
        if(ret == -1)
        {
            break;
        }
    }

    modbus_mapping_free(mb_mapping);

    return 0;
}