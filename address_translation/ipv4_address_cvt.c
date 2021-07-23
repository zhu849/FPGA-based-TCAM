#define _CRT_SECURE_NO_WARNINGS
#include<stdlib.h>
#include<stdio.h>
#include<string.h>

#define STR_BUF_LEN 100
#define INPUT_FILE_NAME "route_table.txt"
#define OUTPUT_FILE_NAME "route_table_binary.txt"
#define MAX_TABLE_SIZE 1000


void int_to_binary(int val, char cvt_int[8]) {
	for (int i = 7; i >= 0; i--, val /= 2) {
		if(val % 2)
			cvt_int[i] = '1';
		else
			cvt_int[i] = '0';
	}
}


int main() {

	FILE* fp;
	FILE* fpw;
	char string[STR_BUF_LEN];
	char buf[STR_BUF_LEN], * str1;
	char tok[] = "./";
	char cvt_int[8];
	int count = 0, tmp;

	fp = fopen(INPUT_FILE_NAME, "r");
	fpw = fopen(OUTPUT_FILE_NAME, "w");
	

	while (fgets(string, STR_BUF_LEN - 1, fp) != NULL && count < MAX_TABLE_SIZE) {
		sprintf(buf, "%s\0", strtok(string, tok));
		tmp = atoi(buf);
		int_to_binary(tmp, cvt_int);
		fwrite(cvt_int, sizeof(char), sizeof(cvt_int), fpw);
		sprintf(buf, "%s\0", strtok(NULL, tok));
		tmp = atoi(buf);
		int_to_binary(tmp, cvt_int);
		fwrite(cvt_int, sizeof(char), sizeof(cvt_int), fpw);
		sprintf(buf, "%s\0", strtok(NULL, tok));
		tmp = atoi(buf);
		int_to_binary(tmp, cvt_int);
		fwrite(cvt_int, sizeof(char), sizeof(cvt_int), fpw);
		sprintf(buf, "%s\0", strtok(NULL, tok));
		tmp = atoi(buf);
		int_to_binary(tmp, cvt_int);
		fwrite(cvt_int, sizeof(char), sizeof(cvt_int), fpw);
		fwrite("\n", sizeof(char), 1, fpw);
		count++;
		
	}
	fclose(fp);
	
	return 0;

}