from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
import time , datetime
#---------------------------------python tutor import--------------------------------
from account.models import Member, Sourcecode
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
        # print(text)
        # print(type(text))

        # get_exec(text)
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
    # print(main_text)

    return out_s.getvalue()


def test_h(request):
    # confirm -> post 로 설정하고
    # 만약 여기서
    print("hi")
    return render(request, 'test_h.html' , context = {
        'code' : ["d"],
        'error' : '',
        'catch' : 0
    })

def visualize(request):
    return render(request, 'visualize.html')

def main_test(request):
    return render(request, 'main_test.html')

def test2_h(request):
    print("start")
    a=[]
    text = request.GET['code']
    print(text)
    # 예외처리
    try:
        print("try context")
        exec(text)
        print("after text")
    except Exception as e:
        print("1111111111111111111")
        print("the code  is " + eval(get_exec(text))['code'])
        context = {
            'code' : eval(get_exec(text))['code'] ,
            'catch' : 1 ,
            'error' : e
        }
        return render(request , 'test_h.html' , context)
        # 예외처리 하였지만 js 에서 출력이 되지않음
    start_time = time.time()
    trace = eval(get_exec(text))
    print(trace)
    a.append(trace['code'])
    execution_time = time.time() - start_time

    user_session_numb = request.session.get('user_numb')# 유저 세션 있고 ,
    if user_session_numb:# 세션이 존재한다면
        # print(user_session_numb)
        # print(type(user_session_numb))
        Sourcecode(
           user_code = text ,
           code_date = datetime.datetime.now() ,
           code_title = 'Bubble_sort' ,
           process_time= execution_time ,
           user_number = Member.objects.get(user_number = user_session_numb)
        ).save()
    #print(trace['exception_msg'])
    # print(text)
    # print(trace)
    # print(type(trace['code']))
    # print(trace)
    context = {
        'code' : a,
        'trace' : trace['trace'],
    }
    # print(context['code'])
    return render(request, 'test2_h.html', context)

def search_table(request):
    search_key = request.GET['search_key']
    context = {'search_key':search_key}

    return render(request,'only_table.html',context)

