function [conv_u, conv_v, diff_u, diff_v] = partA(N, L, u, v)

    halo_print_u = halo_update(u);
    halo_print_v = halo_update(v);

    %% CONVECTIVE

    [conv_u, conv_v] = convective_term(halo_print_u, halo_print_v, N, L);

    %% DIFFUSIVE

    [diff_u, diff_v] = diffusive(halo_print_u, halo_print_v, N, L);
