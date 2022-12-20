##############
STL-10 dataset
##############

`<https://cs.stanford.edu/~acoates/stl10/>`_

The STL-10 dataset is an image recognition dataset for developing unsupervised
feature learning, deep learning, self-taught learning algorithms. It is
inspired by the `CIFAR-10 dataset
<http://www.cs.toronto.edu/~kriz/cifar.html>`__ but with some modifications. In
particular, each class has fewer labeled training examples than in CIFAR-10,
but a very large set of unlabeled examples is provided to learn image models
prior to supervised training. The primary challenge is to make use of the
unlabeled data (which comes from a similar but different distribution from the
labeled data) to build a useful prior. We also expect that the higher
resolution of this dataset (96x96) will make it a challenging benchmark for
developing more scalable unsupervised learning methods.

********
Overview
********

-  10 classes: airplane, bird, car, cat, deer, dog, horse, monkey, ship, truck.
-  Images are 96x96 pixels, color.
-  500 training images (10 pre-defined folds), 800 test images per class.
-  100000 unlabeled images for unsupervised learning. These examples are
   extracted from a similar but broader distribution of images. For instance, it
   contains other types of animals (bears, rabbits, etc.) and vehicles (trains,
   buses, etc.) in addition to the ones in the labeled set.
-  Images were acquired from labeled examples on `ImageNet
   <http://www.image-net.org>`__.

****************
Testing Protocol
****************

We recommend the following standardized testing protocol for reporting results:

-  Perform unsupervised training on the unlabeled.
-  Perform supervised training on the labeled data using 10 (pre-defined) folds
   of 100 examples from the training data. The indices of the examples to be
   used for each fold are provided.
-  Report average accuracy on the full test set.

********
Download
********

-  | `Matlab files <http://ai.stanford.edu/~acoates/stl10/stl10_matlab.tar.gz>`__

   | There are three files: **train.mat, test.mat** and **unlabeled.mat**.
     These files contain variables:

   #. **X, y:** The matrix "X" contains the images for the file as a matrix
      with 1 example per row. In each row, the pixels are laid out in
      *column-major order*, one channel at a time. That is, the first 96*96 values
      are the red channel, the next 96*96 are green, and the last are blue. To
      convert these to a matrix of RGB images, use: reshape(X,10000,96,96,3). The
      vector "y" contains the *labels in the range 1 to 10*.
   #. **class_names:** Contains the text name of each class.
   #. **fold_indices:** In train.mat only. Contains the pre-selected indices of
      the examples to be used for the 10 training trials.  For the i'th fold,
      use: X(fold_indices{i}, :) and y(fold_indices{i}) as your training set.

-  | `Binary files
     <http://ai.stanford.edu/~acoates/stl10/stl10_binary.tar.gz>`__, (`Python code
     <https://github.com/mttk/STL10>`__ from Martin Tutek)

   -  The binary files are split into data and label files with suffixes:
      **train_X.bin, train_y.bin, test_X.bin** and **test_y.bin**. Within each,
      the values are stored as tightly packed arrays of uint8's. The images are
      stored in *column-major order*, one channel at a time. That is, the first
      96*96 values are the red channel, the next 96*96 are green, and the last
      are blue.  The *labels are in the range 1 to 10*. The unlabeled dataset,
      **unlabeled.bin**, is in the same format, but there is no "_y.bin" file.
   -  A **class_names.txt** file is included for reference, with one class name
      per line.
   -  The file **fold_indices.txt** contains the (*zero-based*) indices of the
      examples to be used for each training fold. The first line contains the
      indices for the first fold, the second line, the second fold, and so on.
   -  Thanks to Martin Tutek for the python code to load/view STL-10!  `Python
      code <https://github.com/mttk/STL10>`__

*********
Reference
*********

\* Please cite the following reference in papers using this dataset:

Adam Coates, Honglak Lee, Andrew Y. Ng *An Analysis of Single Layer Networks in
Unsupervised Feature Learning* AISTATS, 2011.  (`PDF
<http://cs.stanford.edu/~acoates/papers/coatesleeng_aistats_2011.pdf>`__)

\* Please use http://cs.stanford.edu/~acoates/stl10 as the URL for this site
   when necessary.

*******
Contact
*******

Send questions to `Adam Coates <http://cs.stanford.edu/~acoates/>`__
