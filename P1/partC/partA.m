function [conv_u, conv_v, diff_u, diff_v] = partA(N, L, u, v)

    %% CONVECTIVE

    [conv_u, conv_v] = convective_term_comp(halo_update(u), halo_update(v), N, L);

    %% DIFFUSIVE

    [diff_u, diff_v] = diffusive(halo_update(u), halo_update(v), N, L);
