#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main()
{
    pid_t p; 
    p=fork();//sys call that creates 2 processes (identical) - parent and child process
    //fork returning value: defines which process is running currently; 
    //if ret value is PID - in parent's process, fork() returns child's PID; in child's process
    if(p==0) //if ret val is 0, it's child process
    {
      
        printf("I am child having PID %d\n",getpid()); //prints child's process
        printf("My parent PID is %d\n",getppid()); //prints parent's process
    }
    else //if ret val is PID, it's parent's process
    {
        //wait(NULL);   
        sleep(100);
 
        printf("I am parent having PID %d\n",getpid()); //print's parent's process
        printf("My child PID is %d\n",p); // print's child's PID stored in p - returning value of fork() sys call

    }
}
