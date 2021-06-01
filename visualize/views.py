from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
import time , datetime
#---------------------------------python tutor import--------------------------------
from account.models import Member, Sourcecode
from visualize.code_processing import pg_logger
import io as StringIO # NB: don't use cStringIO since it doesn't support unicode!!!
import json
#---------------------------------python tutor import--------------------------------
import ast

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
    return out_s.getvalue()


def test_h(request):
    return render(request, 'test_h.html')

def visualize(request):
    return render(request, 'visualize.html')

def main_test(request):
    return render(request, 'main_test.html')

def test2_h(request):
    hong=[]
    text = request.GET['code']
    start_time = time.time()
    test=get_exec(text)
    test =''.join(test)
    test = test.replace("null","\'None\'")
    test = test.replace("false","\'False\'")
    test = test.replace("true","\'True\'")
    # trace = eval(get_exec(text))
    trace=eval(test)
    hong.append(trace['code'])
    execution_time = time.time() - start_time

    user_session_numb = request.session.get('user_numb')# 유저 세션 있고 ,
    if user_session_numb:# 세션이 존재한다면
        title = trace['code'].split('\n')[0]
        if title.startswith('#'): # 주석으로 시작하게되면
            title = title[1:]

        Sourcecode(
           user_code = hong,
           code_date = datetime.datetime.now() ,
           code_title = title ,
           process_time= execution_time ,
           user_number = Member.objects.get(user_number = user_session_numb)
        ).save()
    context = {
        'code' : hong,
        'trace' : trace['trace'],
    }

    return render(request, 'test2_h.html', context)

def search_table(request):
    search_key = request.GET['search_key']
    context = {'search_key':search_key}

    return render(request,'only_table.html',context)

