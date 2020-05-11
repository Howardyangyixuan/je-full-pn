addpath('../');
global_variables;

%% Load HoG features
t_begin = clock;
fprintf('Loading HoG features from \"%s\"...', g_lfd_hog_features_file);
load(g_lfd_hog_features_file);
t_end = clock;
fprintf('done (%f seconds)!\n', etime(t_end, t_begin));


%% Compute distance matrix
t_begin = clock;
fprintf('Computing shape distance matrix, it takes for a while...');
shape_distance_matrix = pdist(lfd_hog_features);
t_end = clock;
fprintf('done (%f seconds)!\n', etime(t_end, t_begin));


%% Save shape distance matrix
t_begin = clock;
fprintf('Save shape distance matrix to \"%s\"...\n', g_shape_distance_matrix_file_mat);
save(g_shape_distance_matrix_file_mat, 'shape_distance_matrix', '-v7.3');
shape_distance_matrix_NxN = squareform(shape_distance_matrix);
dlmwrite(g_shape_distance_matrix_file_txt, shape_distance_matrix_NxN, 'delimiter', ' ');
%% my code
for i=1:length(shape_distance_matrix_NxN)
	for j =1:length(shape_distance_matrix_NxN)
		if shape_distance_matrix_NxN(i, j) <= 0.001 && i < j
			fprintf('zero file %d vs %d\n', i, j);
		end
	end
end

t_end = clock;
fprintf('done (%f seconds)!\n', etime(t_end, t_begin));

exit;
