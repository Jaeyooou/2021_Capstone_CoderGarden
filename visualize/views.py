from django.shortcuts import render , redirect
# Create your views here.

def code_write(request):
    return render(request , '../templates/code_visualize.html')