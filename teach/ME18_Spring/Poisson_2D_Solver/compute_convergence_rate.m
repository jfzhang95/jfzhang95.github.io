function compute_convergence_rate(h,error1,error2,error3,error4)
N=length(error1);
fprintf('\n*** Convergence rate ***\n')
fprintf('%15s %15s %6s %15s %6s %15s %6s %15s %6s\n','h','Max error','order','L2 error','order','H1 error','order','Inf error','order')
for k=1:N
    if k==1
        fprintf('%15.5e %15.5e %6s %15.5e %6s %15.5e %6s %15.5e %6s\n',h(k),error1(k),' ',error2(k),' ',error3(k),' ',error4(k),' ');
    else
        order1=log(abs(error1(k-1))/abs(error1(k)))/log(2);
        order2=log(abs(error2(k-1))/abs(error2(k)))/log(2);
        order3=log(abs(error3(k-1))/abs(error3(k)))/log(2);
        order4=log(abs(error4(k-1))/abs(error4(k)))/log(2);
        fprintf('%15.5e %15.5e %6.3f %15.5e %6.3f %15.5e %6.3f %15.5e %6.3f\n',h(k),error1(k),order1,error2(k),order2,error3(k),order3,error4(k),order4);
    end
end
end