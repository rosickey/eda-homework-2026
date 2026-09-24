module count10 (clk,clr,start,cout,daout);
input clk,clr,start;
output cout;
reg cout;
output [3:0] daout;
wire [3:0] daout;
reg[3:0] cnt;

assign daout = cnt;  //把寄存器cnt的值赋值给输出daout

always @(posedge clk or negedge clr)
begin
    if(!clr)  // clr低电平复位
    begin
        cnt <= 4'b0000;
        cout <= 1'b0;
    end
    else if(start == 1'b1)  // start=1，允许计数
    begin
        if(cnt == 4'b1001) //计数到9
        begin
            cnt <= 4'b0000; //回0
            cout <= 1'b1;   //进位输出拉高
        end
        else
        begin
            cnt <= cnt + 1; //正常+1
            cout <= 1'b0;
        end
    end
end
endmodule
module tb_cnt10;
reg clk,clr,start;
wire cout;
wire [3:0] daout;

count10 uut(.clk,.clr,.start,.cout,.daout);

initial begin
    $dumpfile("cnt10.vcd");
    $dumpvars(0,tb_cnt10);
    clk=0; clr=0; start=0;
    #20 clr=1; start=1;
    #300 $finish;
end
always #10 clk=~clk;
endmodule
