function InitialiseFiniteDifferences(Nx,dx,Order)

global D1 D2 D3 D4
if (Order == 2)
    D1 = spdiags(ones(Nx,1)*[-1,1]/2,[-1,1],Nx,Nx)/dx;
    D1 = spdiags(ones(Nx,1)*[-1,1]/2,[-1,1] + Nx,Nx,Nx)/dx+D1;
    D1 = spdiags(ones(Nx,1)*[-1,1]/2,[-1,1] - Nx,Nx,Nx)/dx+D1;
    D2 = spdiags(ones(Nx,1)*[1,-2,1],[-1,0,1],Nx,Nx)/dx/dx;
    D2 = spdiags(ones(Nx,1)*[1,-2,1],[-1,0,1]+Nx,Nx,Nx)/dx/dx+D2;
    D2 = spdiags(ones(Nx,1)*[1,-2,1],[-1,0,1]-Nx,Nx,Nx)/dx/dx+D2;
    D3 = spdiags(ones(Nx,1)*[-1,2,0,-2,1]/2,[-2,-1,0,1,2],Nx,Nx)/dx/dx/dx;
    D3 = spdiags(ones(Nx,1)*[-1,2,0,-2,1]/2,[-2,-1,0,1,2]+Nx,Nx,Nx)/dx/dx/dx+D3;
    D3 = spdiags(ones(Nx,1)*[-1,2,0,-2,1]/2,[-2,-1,0,1,2]-Nx,Nx,Nx)/dx/dx/dx+D3;
    D4 = spdiags(ones(Nx,1)*[1,-4,6,-4,1],[-2,-1,0,1,2],Nx,Nx)/dx/dx/dx/dx;
    D4 = spdiags(ones(Nx,1)*[1,-4,6,-4,1],[-2,-1,0,1,2]+Nx,Nx,Nx)/dx/dx/dx/dx+D4;
    D4 = spdiags(ones(Nx,1)*[1,-4,6,-4,1],[-2,-1,0,1,2]-Nx,Nx,Nx)/dx/dx/dx/dx+D4;
elseif (Order == 4)
    D1 =      spdiags(ones(Nx,1)*[1,-8,0,8,-1]/12,[-2,-1,0,1,2],Nx,Nx)/dx;
    D1 = D1 + spdiags(ones(Nx,1)*[1,-8,0,8,-1]/12,[-2,-1,0,1,2]+Nx,Nx,Nx)/dx;
    D1 = D1 + spdiags(ones(Nx,1)*[1,-8,0,8,-1]/12,[-2,-1,0,1,2]-Nx,Nx,Nx)/dx;
    D2 =      spdiags(ones(Nx,1)*[-1,16,-30,16,-1]/12,[-2,-1,0,1,2],Nx,Nx)/dx/dx;
    D2 = D2 + spdiags(ones(Nx,1)*[-1,16,-30,16,-1]/12,[-2,-1,0,1,2]+Nx,Nx,Nx)/dx/dx;
    D2 = D2 + spdiags(ones(Nx,1)*[-1,16,-30,16,-1]/12,[-2,-1,0,1,2]-Nx,Nx,Nx)/dx/dx;
    D3 =      spdiags(ones(Nx,1)*[1,-8,13,0,-13,8,-1]/8,[-3,-2,-1,0,1,2,3],Nx,Nx)/dx/dx/dx;
    D3 = D3 + spdiags(ones(Nx,1)*[1,-8,13,0,-13,8,-1]/8,[-3,-2,-1,0,1,2,3]+Nx,Nx,Nx)/dx/dx/dx;
    D3 = D3 + spdiags(ones(Nx,1)*[1,-8,13,0,-13,8,-1]/8,[-3,-2,-1,0,1,2,3]-Nx,Nx,Nx)/dx/dx/dx;
    D4 =      spdiags(ones(Nx,1)*[-1,12,-39,56,-39,12,-1]/6,[-3,-2,-1,0,1,2,3],Nx,Nx)/dx/dx/dx/dx;
    D4 = D4 + spdiags(ones(Nx,1)*[-1,12,-39,56,-39,12,-1]/6,[-3,-2,-1,0,1,2,3]+Nx,Nx,Nx)/dx/dx/dx/dx;
    D4 = D4 + spdiags(ones(Nx,1)*[-1,12,-39,56,-39,12,-1]/6,[-3,-2,-1,0,1,2,3]-Nx,Nx,Nx)/dx/dx/dx/dx;
end

end