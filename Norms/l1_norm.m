function  l1_norm(a, nu)
%  ==================================================
%  l1_norm
%  ==================================================
%  DESCRIPTION
%  __________________________________________________
%  INPUT
%  __________________________________________________
%  OUTPUT
%  __________________________________________________
%  MATLAB 9.11.0.1837725 (R2021b) Update 2
%  Miguel Ayala, 08-Feb-2022.
%  ==================================================

%%% Testing external code
%
%     N = length(a(:,1))-1;
%     vect_nu = nu.^((0:N)');
%     vect_nu(2:end) = 2*vect_nu(2:end);
%     Norm_nu = sum(abs(a).*vect_nu);
% 
% % This function computes the $l^1_{\nu}$ norm of 
% % u=(u_{\alpha})_{\vert\alpha\vert \ge 0}, where $u_{\alpha}$ is a scalar
% 
% if nu==1
%     val=sum(abs(u));
% else
%     vect_alpha=0*u;
%     pos=0;
%     for k=0:N-1    %k=|alpha|
%         vect_alpha(pos+(1:(k+1)))=k*ones((k+1),1);
%         pos=pos+(k+1);
%     end
%     val=abs(u')*nu.^vect_alpha;

end  