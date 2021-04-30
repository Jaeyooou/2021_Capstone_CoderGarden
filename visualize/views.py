from django.shortcuts import render , redirect
from django.http import HttpResponse , JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
# Create your views here.

def code_write(request):
    return render(request , '../templates/code_visualize.html')

@method_decorator(csrf_exempt , name = 'dispatch')
def compiler(request):
    if request.method == 'POST':
        text = request.POST['code']
        exec(text)
    return render(request , '../templates/compile.html')

