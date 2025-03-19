#include "stdio.h"
#include "string.h"
#include "math.h"
struct DoVat {
    char loai[10];
    int trongLuong, giaTri, phuongAn;
    float donGia;
};
DoVat dv[];
void swap(int& a, int& b)
{
    int temp = 0;
    a = b;
    b = temp;
}
void tinhDonGia(DoVat dv[], int n)
{
    for (int i = 0; i <= n; i++)
    {
        dv[i].donGia = dv[i].giaTri / sp[i].trongLuong;
    }
}
void sapXep(DoVat dv[], int n)
{
    for (int i = 1; i <= n - 1; i++)
    {
        for (int j = i + 1; j <= n; j++)
        {
            if (dv[i].donGia < dv[j].donGia)
            {
                swap(dv[i], dv[j]);
            }
        }
    }
}
void greedy(DoVat dv[], int n, float W)
{
    for (int i = 0; i < n; i++)
    {
        dv[i].phuongAn = W / dv[i].trongLuong;
        W -= dv[i].phuongAn * dv[i].trongLuong;
    }
}
