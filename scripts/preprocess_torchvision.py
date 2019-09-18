import torchvision

for split in ("train", "test", "unlabeled", "train+unlabeled"):
    for fold in range(10):
        torchvision.datasets.STL10(".", split=split, folds=fold, download=True)
