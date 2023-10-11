The second homework of the "Numeric Methods" course at the University 
Politehnica of Bucharest, Faculty of Automatic Control and Computer 
Science, 2022-2023.The first task was quite simple,I had to implement the 
singular value decomposition - SVD on a matrix.The second task was to compress
a image using the USV matrix,by removing the smallest singular values,and 
getting an image almost identical to the original one.Third task included the
compression of an image using the principal component analysis - PCA,by 
removing the smallest eigenvalues and getting an image almost identical to the
original one.The fourth task consists of 6 functions.The main purpouse of the 
task is to recognize some decimal numbers handwritten on a piece of paper.
I got the right result in some steps.For the star,I had to prepare the data,
then calculate the covariance matrix,then calculate the eigenvalues and
eigenvectors,then sort the eigenvalues and eigenvectors,then calculate the
projection matrix and finally calculate the projection of the data on the
projection matrix.Then,I transformed the image into a 784 dimensional vector,
then I calculated the projection of the image on the projection matrix and
finally I calculated the euclidean distance between the image and the
projection of the image on the projection matrix by using k-nearest neighbours
algorithm,then finally get the prediction.

Student: Pujleacov Artiom

group: 315CB