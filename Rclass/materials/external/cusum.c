#include <R.h>

void cusum(int *nx, double *x)
{
	int n = nx[0];

	int i;

	for (i=1; i<n; i++)
		x[i] += x[i-1];
}