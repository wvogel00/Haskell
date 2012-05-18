#include <iostream>
#include<stdio.h>
#define Num 10
#define MAX 100000
using namespace std;

typedef struct link{
    int len,capacity;
 }Link;

typedef struct route{
    int n_node;
    int node[Num];
    int distance;
    int hop;
}Route;

Link links[Num][Num];

class Dijkstra{
    Route path;
    int dist[Num],prev[Num];
    bool chk[Num];
    int tmpNode,tmpDist;
    int i,j,s;
public:
Dijkstra(){
        for(i = 0 ; i < Num ; i++){
            dist[i] = MAX;
            chk[i] = false;
            prev[i] = Num;
        }
    }

void ShortestRoute(int start,int end){
    dist[start] = 0;

    while(1){
        int v = -1;

        for(i = 0 ; i < Num ; i++)
            if(!chk[i] && (v == -1 || dist[i] < dist[v]))
                v = i;

        if(v == -1) break;

        chk[v] = true;

        for(int i = 0 ; i < Num ; i++){
            if(dist[i] > dist[v] + links[v][i].len){
                dist[i] = dist[v]+links[v][i].len;
                cout << v<< " -> "<< i  <<" :: " << dist[i] << endl;
                prev[i] = v;
                }
            }
        }

    if(dist[end] < MAX){
        path.n_node = 1;
        for(i = end ; i != start; i = prev[i])
            path.n_node++;
        j = path.n_node -1;
        for(i = end; i != start ; i = prev[i])
            path.node[j--] = i;
        path.node[0] = start;
        path.hop = path.n_node - 1;
        path.distance = dist[end];
    }
    cout << "hop"<< path.hop << endl;
    path.distance = dist[end];
    Show();
}

void Show(){
      cout << "flow == [" ;
      for(i = 0 ; i <=path.hop ; i++){
          cout << path.node[i] << " >" ;
      }
      cout << "\b]" << endl;
      cout << "number nop = " << path.hop << endl;
      cout << "distance = " << path.distance << endl;
    }
};

int main(){
 Dijkstra dijkstra = Dijkstra();
 int n1,n2,start,end;
 int len,capacity;
 int i,j;
 cout << "OK";
 FILE* fp;
 fp = fopen("./test_topology.txt","r");

 for(i = 0 ; i < Num ; i++){
   for(j = 0 ; j < Num ; j++){
      links[i][j].len = MAX; links[j][i].capacity = MAX;
      }
   }
 while(fscanf(fp,"%d %d %d %d",&n1,&n2,&len,&capacity) != EOF){
   links[n1][n2].len = links[n2][n1].len = len;
   links[n1][n2].capacity = links[n2][n1].capacity = capacity;
 }
 fclose(fp);

 cout << "source node?(0~" << Num-1 << ") > ";
 cin >> start;
 cout << "end node?(0~" << Num-1 << ") > ";
 cin >> end;
 dijkstra.ShortestRoute(start,end);

 return 0;
}
