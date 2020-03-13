#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int n = 0;
char production[100][100];

void Array_Manipulation(char array[], char value)
{
    int temp;
    for (temp = 0; array[temp] != '\0'; temp++)
    {
        if (array[temp] == value)
        {
            return;
        }
    }
    array[temp] = value;
    array[temp + 1] = '\0';
}

void Find_First(char *array, char ch)
{
    int count, j, k;
    char temporary_result[20];
    int x;
    temporary_result[0] = '\0';
    array[0] = '\0';
    if (!(isupper(ch)))
    {
        Array_Manipulation(array, ch);
        return;
    }
    for (count = 0; count < n; count++)
    {
        if (production[count][0] == ch)
        {
            if (production[count][2] == '$')
            {
                Array_Manipulation(array, '$');
            }
            else
            {
                j = 2;
                while (production[count][j] != '\0')
                {
                    x = 0;
                    Find_First(temporary_result, production[count][j]);
                    for (k = 0; temporary_result[k] != '\0'; k++)
                    {
                        Array_Manipulation(array, temporary_result[k]);
                    }
                    for (k = 0; temporary_result[k] != '\0'; k++)
                    {
                        if (temporary_result[k] == '$')
                        {
                            x = 1;
                            break;
                        }
                    }
                    if (!x)
                    {
                        break;
                    }
                    j++;
                }
            }
        }
    }
    return;
}

int main(int argc, char const *argv[])
{

    printf("Enter no of productions:");
    scanf("%d", &n);

    printf("Enter productions in the form A -> B\nCapital letters will be treated as Variable and anything else as Terminal\n");
    for (int i = 0; i <= n; i++)
    {
        char prod[100];
        gets(prod);
        strcpy(production[i], prod);
    }

    for (int i = 0; i < n; i++)
    {
        Find_First()
    }

    return 0;
}
