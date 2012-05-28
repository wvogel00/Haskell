#include <iostream>
#include<stdio.h>
#include<cstring>
#include<cstdlib>
#include<ctime>

#define Num 10
#define MAX 10000
#define N 10000
#define NP 10000
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
    typedef struct memory{
        int start,end;
        int prev[Num];
    }Memory;

    Link maxRoute[Num][Num];
    Link simRoute[Num][Num];
    Route path;
    int dist[Num],prev[Num];
    bool chk[Num];
    int tmpNode,tmpDist;
    int i,j,s;
    Memory memoryRoute[NP];	//NP回前の経路を記憶する
public:
Dijkstra(){  //コンストラクタ
    srand((unsigned)time(NULL));
    for(i = 0 ; i < Num ; i++){
        dist[i] = MAX;
        chk[i] = false;
        prev[i] = Num;
    }
}

public:
void Initialize(){  //経路選択に必要な変数群を初期化
    for(i = 0 ; i < Num ; i++){
        dist[i] = MAX;
        chk[i] = false;
        prev[i] = Num;
    }
}

public:
void Simulate(Link route[Num][Num]){  //シミュレータを走らせる関数
    int start,end,k,blocks = 0;
    bool success;
    cout << "1::dijkstra" << endl << "2::shortestMax" << endl;
    cin >> k;

    for(i = 0 ; i < Num ; i++){
        for(j = 0 ; j < Num ; j++){//シミュレーション用に配列を用意
            simRoute[i][j].len = simRoute[j][i].len = route[i][j].len;
            simRoute[i][j].capacity = simRoute[j][i].capacity = route[i][j].capacity;
        }
    }

    for(int counter = 0 ; counter < N ; counter++){
        start = rand()%Num;
        end = rand()%Num;
        Initialize();  //毎経路選択前に、初期化を行う
        if(k == 1)
            success = ShortestRoute(start,end,simRoute);
        else if(k == 2)
            success = MaxRoute(start,end,simRoute);

        if(counter >= NP) // np回前の通信に用いた経路の容量回復を行う
            RecoveryRoute(start,end,counter%NP,route);
        
        if(success){
           UpdateSimRoute(start,end);
           RememberRoute(start,end,counter%NP);
        }
        if(!success) blocks++;
    }

    cout << "b=" << blocks << endl << "呼損率 = " << (double)blocks/N << endl;
}
private:
void RecoveryRoute(int start,int end,int np,Link route[Num][Num]){
    for(int tmp = memoryRoute[np].end ; tmp != memoryRoute[np].start ; tmp = memoryRoute[np].prev[tmp]){
        if(simRoute[memoryRoute[np].prev[tmp]][tmp].capacity < route[memoryRoute[np].prev[tmp]][tmp].capacity){
            simRoute[memoryRoute[np].prev[tmp]][tmp].capacity++;
            simRoute[memoryRoute[np].prev[tmp]][tmp].len = route[prev[tmp]][tmp].len;
        }
    }
}

private:
void UpdateSimRoute(int start,int end){
    for(int tmp = end ; tmp != start ; tmp = prev[tmp]){ //更新
        if(simRoute[prev[tmp]][tmp].capacity > 0)
            simRoute[prev[tmp]][tmp].capacity--;
        if(simRoute[prev[tmp]][tmp].capacity == 0)
            simRoute[prev[tmp]][tmp].len = MAX;
    }
    
}

private:
void RememberRoute(int start,int end,int np){
    for(int tmp = end ; tmp != start ; tmp = prev[tmp]){
        memoryRoute[np].prev[tmp] = prev[tmp];
    }
    memoryRoute[np].start = start;
    memoryRoute[np].end = end;

}
public://渡されたノード表に対して、最短最大路を求める
bool MaxRoute(int start,int end , Link route[Num][Num]){
    int max = 0;
    //配列の初期化
    for(i = 0 ; i < Num ; i++){
        for(j = 0 ; j < Num ; j++){
            maxRoute[i][j].len = maxRoute[i][j].capacity = MAX;
            if (max < route[i][j].capacity && route[i][j].capacity < MAX)
                max = route[i][j].capacity;
       }
    }

    while( max > 0){
       //cout << "---MAX====" << max << endl;
        for(i = 0 ; i < Num ; i++){
            for(j = 0 ; j < Num ; j++){
                if (max == route[i][j].capacity){
                    maxRoute[i][j].capacity = maxRoute[j][i].capacity = route[i][j].capacity;
                    maxRoute[j][i].len = maxRoute[i][j].len = route[i][j].len;
                }
            }
        }
        max--;
        for(i = 0 ; i < Num ; i++) chk[i] = false;
        if(isLinked(start,end)) break;
    }

    if(max == 0) return false; //失敗

    max++; 
    for(i = 0 ; i < Num ; i++){
        for(j = 0 ; j < Num ; j++){
            if (max == route[i][j].capacity){
                maxRoute[i][j].capacity = maxRoute[j][i].capacity = route[i][j].capacity;
                maxRoute[i][j].len = maxRoute[j][i].len = route[i][j].len;
                }
        }
    }
    Initialize();
    return ShortestRoute(start,end,maxRoute);
}

private:
bool isLinked(int start,int end){
    bool flag = false;
    int k ;

    for( k = 0 ; k < Num ; k++){
        if(maxRoute[start][k].capacity < MAX && !chk[k]){
            //cout << "(" << start << "," << k << ")" << endl;
            if(k == end) return true;
            chk[k] = true;
            flag = flag || isLinked(k,end);
        }
    }
    return flag;
}

public://渡された接続表に対して、dijkstraで最短距離を求める
bool ShortestRoute(int start,int end , Link route[Num][Num]){
    dist[start] = 0;

    while(1){
        int v = -1;

        for(i = 0 ; i < Num ; i++)
            if(!chk[i] && (v == -1 || dist[i] < dist[v]))
                v = i;

        if(v == -1) break;

        chk[v] = true;

        for(int i = 0 ; i < Num ; i++){
            if(dist[i] > dist[v] + route[v][i].len){
                dist[i] = dist[v]+route[v][i].len;
                //cout << v<< " -> "<< i  <<" :: " << dist[i] << endl;
                prev[i] = v;
                }
            }
        }

    for(i = end ; i != start ; i= prev[i]){
        if(prev[i] == Num) return false;
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
    path.distance = dist[end];
    //Show();
    return true;
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
 int n1,n2;
 int len,capacity;
 int i,j;
 FILE* fp;
// fp = fopen("./test_topology.txt","r");
 fp = fopen("./topology2.txt","r");

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

 int start,end;
 cout << "source node?(0~" << Num-1 << ") > ";
 cin >> start;
 cout << "end node?(0~" << Num-1 << ") > ";
 cin >> end;

 //dijkstra.ShortestRoute(start,end,links);
// dijkstra.Simulate(links);
 //cout << "最大路" << endl;
 dijkstra.MaxRoute(start,end,links);
 dijkstra.Show();
 return 0;
}
