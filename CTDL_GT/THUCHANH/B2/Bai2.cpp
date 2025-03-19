#include "stdio.h"
#include "conio.h"
struct PhanSo{
	int tuSo;
	int mauSo;
};
struct Node{
	PhanSo ps;
	Node *next;
};
struct SList{
	Node *head;
	Node *tail;
};
Node *createNode(int x, int y){
	Node *p = new Node;
	if (p == NULL){
		printf("Khong du bo nho de cap phat!");
		return NULL;
	}
	p->ps.tuSo = x;
	p->ps.mauSo = y;
	p->next = NULL;
	return p;
}
void menu();
void initSList(SList &sl);
void addTailSList(SList &sl, Node *p);
void createList(SList &sl);
void printList(SList sl);
void toiGianPhanSo(Node *p);
void toiGianCacPhanSo(SList &sl);
Node *tinhTongCacPhanSo(SList sl);
Node *tinhTichCacPhanSo(SList sl);
Node *timPhanSoMax(SList sl);
Node *timPhanSoMin(SList sl);
void tangMoiPhanSoLen1DonVi(SList &sl);
void xuatCacPhanSoLonHon1(SList sl);
Node *timNodeTrongSList(SList sl, int tuSo, int mauSo);
int main(){
	menu();
	return 0;
}
void menu(){
	printf("1. Nhap/xuat danh sach co n phan so.");
	printf("\n2. Toi gian cac phan so.");
	printf("\n3. Tinh tong/tich cac phan so.");
	printf("\n4. Cho biet cac phan so lon nhat, phan so nho nhat.");
	printf("\n5. Tang moi phan so cua danh sach len 1 don vi.");
	printf("\n6. Xuat cac phan so lon hon 1 trong danh sach lien ket.");
	printf("\n7. Viet ham tra ve SNode chua phan so p trong danh sach lien ket.Neu khong co p trong DSLK thi tra ve NULL");
	int nhap;
	SList sl;
	do{
		printf("\n\nNhap O de thoat!");
		printf("\nNhap thao tac muon thuc hien: "); scanf("%d", &nhap);
		switch (nhap){
			case 1:{
				initSList(sl);
				createList(sl);
				printf("\n\tSList: ");
				printList(sl);
				break;
			}
			case 2:{
				toiGianCacPhanSo(sl);
				printf("\n\tSList sau khi toi gian cac phan so: ");
				printList(sl);
				break;
			}
			case 3:{
				Node *sum = tinhTongCacPhanSo(sl);
				toiGianPhanSo(sum);
				printf("\n\tTong la: ");
				if (sum->ps.mauSo == 1){
					printf("%d ", sum->ps.tuSo);
				}
				else{
					printf("%d/%d ", sum->ps.tuSo, sum->ps.mauSo);
				}
				Node *tich = tinhTichCacPhanSo(sl);
				toiGianPhanSo(tich);
				printf("\n\tTich la: ");
				if (tich->ps.mauSo == 1){
					printf("%d ", tich->ps.tuSo);
				}
				else{
					printf("%d/%d ", tich->ps.tuSo, tich->ps.mauSo);
				}
				break;
			}
			case 4:{
				toiGianCacPhanSo(sl);
				Node *max = timPhanSoMax(sl);
				printf("\n\tMax la: ");
				if (max->ps.mauSo == 1){
					printf("%d ", max->ps.tuSo);
				}
				else{
					printf("%d/%d ", max->ps.tuSo, max->ps.mauSo);
				}
				Node *min = timPhanSoMin(sl);
				printf("\n\tMin la: ");
				if (min->ps.mauSo == 1){
					printf("%d ", min->ps.tuSo);
				}
				else{
					printf("%d/%d ", min->ps.tuSo, min->ps.mauSo);
				}
				break;
			}
			case 5:{
				tangMoiPhanSoLen1DonVi(sl);
				printf("\n\tSlist sau khi tang moi phan so len 1 don vi la: ");
				printList(sl);
				break;
			}
			case 6:{
				printf("\n\tCac phan so lon hon 1: ");
				xuatCacPhanSoLonHon1(sl);
				break;
			}
			case 7:{
				int tuSo, mauSo;
				printf("Nhap tu so va mau so cua p: ");
				scanf("%d%d",&tuSo,&mauSo);
				Node *p = timNodeTrongSList(sl,tuSo,mauSo);
				printf("\n\tSNode chua phan so can tim: ");
				if (p->ps.mauSo == 1){
					printf("%d ", p->ps.tuSo);
				}
				else{
					printf("%d/%d ", p->ps.tuSo, p->ps.mauSo);
				}
				break;
			}
			default:{
				if(nhap != 0){
					printf("\n\tThao tac khong hop le!");
				}
				break;
			}
		}
	} while (nhap != 0);
}
void initSList(SList &sl){
	sl.head = sl.tail = NULL;
}
void addTailSList(SList &sl, Node *p){
	if (p == NULL){
		return;
	}
	else{
		if (sl.head == NULL){
			sl.head = sl.tail = p;
		}
		else{
			sl.tail->next = p;
			sl.tail = p;
		}
	}
}
void createList(SList &sl){
	int n,x,y;
	Node *p = new Node;
	printf("Nhap so luong phan so: "); scanf("%d", &n);
	for (int i = 1; i <= n; i++){
		printf("\tNhap phan so thu %d: ", i);
		printf("\nNhap tu so: ");
		scanf("%d", &x);
		printf("Nhap mau so: ");
		scanf("%d", &y);
		p = createNode(x, y);
		addTailSList(sl, p);
	}
}
void printList(SList sl){
	Node *temp = sl.head;
	while (temp != NULL){
		if (temp->ps.mauSo == 1){
			printf("%d ", temp->ps.tuSo);
		}
		else{
			printf("%d/%d ", temp->ps.tuSo, temp->ps.mauSo);
		}
		temp = temp->next;
	}
}
int timUCLN(int a, int b){
	if (a == 0 || b == 0){
		return a + b;
	}
	while (a != b){
		if (a > b){
			a = a - b;
		}
		else{
			b = b - a;
		}
	}
	return a;
}
void toiGianPhanSo(Node *p){
	int UCLN = timUCLN(p->ps.tuSo, p->ps.mauSo);
	p->ps.tuSo = p->ps.tuSo / UCLN;
	p->ps.mauSo = p->ps.mauSo / UCLN;
}
void toiGianCacPhanSo(SList &sl){
	Node *temp = sl.head;
	while (temp != NULL){
		toiGianPhanSo(temp);
		temp = temp->next;
	}
}
Node *tinhTongCacPhanSo(SList sl){
	int tuSo = sl.head->ps.tuSo;
	int mauSo = sl.head->ps.mauSo;;
	for (Node *i = sl.head->next; i != NULL; i = i->next){
		tuSo = i->ps.tuSo * mauSo + tuSo * i->ps.mauSo;
		mauSo = i->ps.mauSo * mauSo;
	}
	Node *temp = new Node;
	temp->ps.tuSo = tuSo;
	temp->ps.mauSo = mauSo;
	return temp;
}
Node *tinhTichCacPhanSo(SList sl){
	int tuSo = sl.head->ps.tuSo;
	int mauSo = sl.head->ps.mauSo;;
	for (Node *i = sl.head->next; i != NULL; i = i->next){
		tuSo = i->ps.tuSo * tuSo;
		mauSo = i->ps.mauSo * mauSo;
	}
	Node *temp = new Node;
	temp->ps.tuSo = tuSo;
	temp->ps.mauSo = mauSo;
	return temp;
}
Node *timPhanSoMax(SList sl){
	int tuSoMax = sl.head->ps.tuSo;
	int mauSoMax = sl.head->ps.mauSo;
	float max = (float)sl.head->ps.tuSo / sl.head->ps.mauSo;
	for (Node *i = sl.head->next; i != NULL; i = i->next){
		float temp = (float) i->ps.tuSo / i->ps.mauSo;
		if (temp > max){
			tuSoMax = i->ps.tuSo;
			mauSoMax = i->ps.mauSo;
			max = temp;
		}
	}
	Node *temp = new Node;
	temp->ps.tuSo = tuSoMax;
	temp->ps.mauSo = mauSoMax;
	return temp;
}
Node *timPhanSoMin(SList sl){
	int tuSoMin = sl.head->ps.tuSo;
	int mauSoMin = sl.head->ps.mauSo;
	float min = (float)sl.head->ps.tuSo / sl.head->ps.mauSo;
	for (Node *i = sl.head->next; i != NULL; i = i->next){
		float temp = (float)i->ps.tuSo / i->ps.mauSo;
		if (temp < min){
			tuSoMin = i->ps.tuSo;
			mauSoMin = i->ps.mauSo;
			min = temp;
		}
	}
	Node *temp = new Node;
	temp->ps.tuSo = tuSoMin;
	temp->ps.mauSo = mauSoMin;
	return temp;
}
void tangMoiPhanSoLen1DonVi(SList &sl){
	for(Node *i = sl.head; i != NULL; i = i->next){
		i->ps.tuSo = i->ps.tuSo * 1 + 1 * i->ps.mauSo;
		i->ps.mauSo = i->ps.mauSo * 1;
	}
}
void xuatCacPhanSoLonHon1(SList sl){
	for(Node *i = sl.head; i != NULL; i = i->next){
		float phanso = (float) i->ps.tuSo / i->ps.mauSo;
		if(phanso > 1){
			if (i->ps.mauSo == 1){
				printf("%d ", i->ps.tuSo);
			}else{
				printf("%d/%d ", i->ps.tuSo, i->ps.mauSo);
			}
		}
	}
}
Node *timNodeTrongSList(SList sl, int tuSo, int mauSo){
	for(Node *i = sl.head; i != NULL; i = i->next){
		if(i->ps.tuSo == tuSo && i->ps.mauSo == mauSo){
			return i;
		}
	}
	return NULL;
}
