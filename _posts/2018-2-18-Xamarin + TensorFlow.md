---
layout: post
title: "Xamarin and TensowFlow: Part one - training the model"
description: "This article is going to describe how we can use deep learning with TensorFlow for training a model which will be looking at a picture for finding some object on the picture, and how it is actually easy to do."
date: 2018-02-18
tags: [TensowFlow, DL, ML, "Deep Learning", "Machine Learning", "Transfer Learning", "ImageNet", "Convolutional neural network", "Inception-v3", "Softmax regression"]
comments: true
share: true
published: true
---

It'll be discussion about three topics. In the first on, which is this article, we'll create a model for image recognition. In the others we'll try to use that model in Xamarin applications.

- Creating the model
- Binding for Xamarin.Android
- Binding for Xamarin.iOS

### Prolog

It was a usual evening. I was reading Medium and in parallel thinking how I should begin learning neural networks/DL/ML/etc. So, my girlfriend has a cat, very annoying cat. Another useless fact is that I'm a big fan of Silicon Valley show. Well, suddenly I got an idea. What if I'd create an app like in the show, you know, the "hotdog, not hotdog app", but instead of hotdog an app would be searching and telling me where the cat is. Like "Melvy, not Melvy" cat (Yes, Melvy is the cat name). So, that's an idea.

### Intro

The article is going to be step by step instruction how you could create your own model and you don't have to be a neural network specialist! I'm serios, I'm not NN specialist at all, but even I could make a specific DL model without any help from someone.

But, apparently, for understanding what's going on, you have to know some basics stuff. I'll briefly touch some certain terms to make it more clear:

**Convolutional neural network** - this type of models really good fit for solving image recognition problems.

**Softmax regression** - type of regression which allows you really good split something into categories.

**Transfer Learning** - this technique allows you remove top layer in your model and retrain it for something else. The reason is why it's evry usefull it's because usually (at leats in my case) we don't have enough CPU/GPU power to train whole model. So, we could take some existing, pretty well working model which was trained for some issue and retrain only one top layer from model for our particullar issue which also has to be simillar with "main problem". In our case we are going to take latest [Inception-v3](https://arxiv.org/abs/1512.00567) model and retrain it.

### Let's start

So, first of all, we'll try to train the model for a certain categories of pictures - flowers. Wy not cat pictures? You could do that. Flower pictires already exist and we don't have to collect of 100 pics at least for each category. But if you have ones, especialy if they're cat pictures, go ahead. Let's make a folder for our project:

```
mkdir flowersproject
```

Then let's download our flowers into the folder and unpack them:

```
cd flowersproject
curl -O http://download.tensorflow.org/example_images/flower_photos.tgz
tar xzf flower_photos.tgz
```

So, the next step is cloning tensorflow from githib into our folder

```
git clone https://github.com/tensorflow/tensorflow
cd tensorflow
```

Make sure that you're on master branch

```
git checkout master
```

In the simplest cases the retrainer can then be run like this:

```
python tensorflow/examples/image_retraining/retrain.py --image_dir ../flower_photos
```
During the time you'll see simillar lines in terminal:

![image](http://g0rdan.com/assets/images/5wUW5nDhRi2U4qOtbik-Wg.png)

It means the model began learning.

You need only one thing. The thing is data, which in our case it's categorized pictutes. Each name of flower folders represent a label for this type of data. So, you could find another flower pictures such as carnations, collect more than 100 pics of this type of flowers, put them into 'carnation' folder and the model would be able to recognize it.  

After a few minutes (or 20 - 30 mins, depens on your CPU) you'll get a brandnew retrained model! That's all! This'is super easy, isn't? By default, your model will be created as `/tmp/output_graph.pb` and labels information as `/tmp/output_labels.txt`. We need these files for creating mobile applications. If you don't know, the `.pb` format is protobuf which is binary format of representation of structured data. You could image it as JSON but in binary representation. Much smaller, but not readable for humans.

Well, we have the model, but how can we test it? So, for that we have other python script which already has written for us. It's ```tensorflow/examples/label_image/label_image.py```.

Here's an example of how to run the label_image example with your retrained graphs:
```
python tensorflow/examples/label_image/label_image.py \
--graph=/tmp/output_graph.pb --labels=/tmp/output_labels.txt \
--input_layer=Mul \
--output_layer=final_result \
--input_mean=128 --input_std=128 \
--image=$HOME/flower_photos/daisy/21652746_cc379e0eea_m.jpg
```

Since you've replaced the top layer, you will need to specify the new name in the script, for example with the flag ```--output_layer=final_result``` if you're using label_image.

You should see a list of flower labels, in most cases with daisy on top (though each retrained model may be slightly different). You can replace the --image parameter with your own images to try those out.

### Improvements for mobile applications

So, we got our model. Let's see the size of this model. I don't know about your's, but mine was something around 95 Mb and, of course, it's unacceptable. Not only because it's sort of a big size for mobile application but also using this model in mobile app could be with lags and freezes.

Let's find out how we can reduce size of this model with acceptable losses in quality of recognition. There are two basics ways to reduce size of model in this particulat situation. It's juggling of input picture resolution or amount of parameters of model architecture. Fortunately for us, we already have [pretrained 32 models](https://research.googleblog.com/2017/06/mobilenets-open-source-models-for.html). To use them we have to pass ```--architecture``` parameter in ```retrain.py``` script. For example this command:
```
python tensorflow/examples/image_retraining/retrain.py \
    --image_dir ../flower_photos --architecture mobilenet_0.25_128
```
will create a 941KB model file in ```/tmp/output_graph.pb```, with 25% of the parameters of the full Mobilenet, taking 128x128 sized input images. You can choose '1.0', '0.75', '0.50', or '0.25' to control the number of weight parameters, and so the file size (and to some extent the speed), '224', '192', '160', or '128' for the input image size, with smaller sizes giving faster speeds

### PS

This article briefly explains how we can train a simple neural network model for image recognition. For making all steps which explaid here you should have installed python and git. I recommend visit offitial [TensorFlow tutorial pages](https://www.tensorflow.org/get_started/) for much more information about the topic.
Next topic is going to show how we could use the trained model in Xamarin.Android application!