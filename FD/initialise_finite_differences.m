function initialise_finite_differences(nx, dx, order)
    
    global D1 D2 D3 D4
    if (order == 2)
        D1 = spdiags(ones(nx,1)*[-1,1]/2,[-1,1],nx,nx)/dx;
        D1 = spdiags(ones(nx,1)*[-1,1]/2,[-1,1] + nx,nx,nx)/dx+D1;
        D1 = spdiags(ones(nx,1)*[-1,1]/2,[-1,1] - nx,nx,nx)/dx+D1;
        D2 = spdiags(ones(nx,1)*[1,-2,1],[-1,0,1],nx,nx)/dx/dx;
        D2 = spdiags(ones(nx,1)*[1,-2,1],[-1,0,1]+nx,nx,nx)/dx/dx+D2;
        D2 = spdiags(ones(nx,1)*[1,-2,1],[-1,0,1]-nx,nx,nx)/dx/dx+D2;
        D3 = spdiags(ones(nx,1)*[-1,2,0,-2,1]/2,[-2,-1,0,1,2],nx,nx)/dx/dx/dx;
        D3 = spdiags(ones(nx,1)*[-1,2,0,-2,1]/2,[-2,-1,0,1,2]+nx,nx,nx)/dx/dx/dx+D3;
        D3 = spdiags(ones(nx,1)*[-1,2,0,-2,1]/2,[-2,-1,0,1,2]-nx,nx,nx)/dx/dx/dx+D3;
        D4 = spdiags(ones(nx,1)*[1,-4,6,-4,1],[-2,-1,0,1,2],nx,nx)/dx/dx/dx/dx;
        D4 = spdiags(ones(nx,1)*[1,-4,6,-4,1],[-2,-1,0,1,2]+nx,nx,nx)/dx/dx/dx/dx+D4;
        D4 = spdiags(ones(nx,1)*[1,-4,6,-4,1],[-2,-1,0,1,2]-nx,nx,nx)/dx/dx/dx/dx+D4;
    elseif (order == 4)
        D1 =      spdiags(ones(nx,1)*[1,-8,0,8,-1]/12,[-2,-1,0,1,2],nx,nx)/dx;
        D1 = D1 + spdiags(ones(nx,1)*[1,-8,0,8,-1]/12,[-2,-1,0,1,2]+nx,nx,nx)/dx;
        D1 = D1 + spdiags(ones(nx,1)*[1,-8,0,8,-1]/12,[-2,-1,0,1,2]-nx,nx,nx)/dx;
        D2 =      spdiags(ones(nx,1)*[-1,16,-30,16,-1]/12,[-2,-1,0,1,2],nx,nx)/dx/dx;
        D2 = D2 + spdiags(ones(nx,1)*[-1,16,-30,16,-1]/12,[-2,-1,0,1,2]+nx,nx,nx)/dx/dx;
        D2 = D2 + spdiags(ones(nx,1)*[-1,16,-30,16,-1]/12,[-2,-1,0,1,2]-nx,nx,nx)/dx/dx;
        D3 =      spdiags(ones(nx,1)*[1,-8,13,0,-13,8,-1]/8,[-3,-2,-1,0,1,2,3],nx,nx)/dx/dx/dx;
        D3 = D3 + spdiags(ones(nx,1)*[1,-8,13,0,-13,8,-1]/8,[-3,-2,-1,0,1,2,3]+nx,nx,nx)/dx/dx/dx;
        D3 = D3 + spdiags(ones(nx,1)*[1,-8,13,0,-13,8,-1]/8,[-3,-2,-1,0,1,2,3]-nx,nx,nx)/dx/dx/dx;
        D4 =      spdiags(ones(nx,1)*[-1,12,-39,56,-39,12,-1]/6,[-3,-2,-1,0,1,2,3],nx,nx)/dx/dx/dx/dx;
        D4 = D4 + spdiags(ones(nx,1)*[-1,12,-39,56,-39,12,-1]/6,[-3,-2,-1,0,1,2,3]+nx,nx,nx)/dx/dx/dx/dx;
        D4 = D4 + spdiags(ones(nx,1)*[-1,12,-39,56,-39,12,-1]/6,[-3,-2,-1,0,1,2,3]-nx,nx,nx)/dx/dx/dx/dx;
    end
    
end