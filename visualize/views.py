from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator

#---------------------------------python tutor import--------------------------------
from visualize.code_processing import pg_logger
import io as StringIO # NB: don't use cStringIO since it doesn't support unicode!!!
import json
#---------------------------------python tutor import--------------------------------


# Create your views here.
main_json = ''
main_option = {u'origin': u'a',
               u'cumulative_mode': False,
               u'heap_primitives': False,
               u'show_only_outputs': False,
               u'py_crazy_mode': False}
main_json_option = json.dumps(main_option)


def code_write(request):
    return render(request , '../templates/code_visualize.html')

@method_decorator(csrf_exempt , name = 'dispatch')
def compiler(request):
    if request.method == 'POST':
        text = request.POST['code']
        print(text)
        print(type(text))

        exec(text)
        get_exec(text)
    return render(request , '../templates/compile.html')


def get_exec(main_text):
    out_s = StringIO.StringIO()

    def json_finalizer(input_code, output_trace):
        ret = dict(code=input_code, trace=output_trace)
        json_output = json.dumps(ret, indent=None)
        out_s.write(json_output)

    options = json.loads(main_json_option)

    pg_logger.exec_script_str_local(main_text,
                                  main_json,
                                  options['cumulative_mode'],
                                  options['heap_primitives'],
                                  json_finalizer)
    print("MAINTEXT다이새끼야조")
    print(main_text)
    return out_s.getvalue()


def test_h(request):
    return render(request, 'test_h.html')

def visualize(request):
    return render(request, 'visualize.html')

def main_test(request):
    return render(request, 'main_test.html')

def test2_h(request):
    a=[]
    text = request.GET['code']
    trace = eval(get_exec(text))
    a.append(trace['code'])
    print(a)
    context = {
        'code' : a,
        'trace' : trace['trace']
    }
    print(context['code'])
    return render(request, 'test2_h.html', context)

def search_table(request):
    search_key = request.GET['search_key']
    context = {'search_key':search_key}

    return render(request,'only_table.html',context)

