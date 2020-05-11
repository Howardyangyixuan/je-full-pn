for i in mix
do
  python ./convert_global_variables.py $i;
  cd shape_embedding_training;
  /usr/local/MATLAB/R2014a/bin/matlab -nodisplay -r compute_shape_distance_matrix;
  /usr/local/MATLAB/R2014a/bin/matlab -nodisplay -r compute_shape_embedding_space;
  cd ..;
done