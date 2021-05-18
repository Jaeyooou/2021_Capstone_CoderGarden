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


# Create your views here.
main_json = ''
main_option = {u'origin': u'opt-frontend.js', u'cumulative_mode': False, u'heap_primitives': False, u'show_only_outputs': False, u'py_crazy_mode': False}
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

def test2_h(request):
    text = request.GET['code']
    start_time = time.time()
    trace = eval(get_exec(text))
    execution_time = time.time() - start_time

    user_session_numb = request.session.get('user_numb')# 유저 세션 있고 ,
    if user_session_numb:# 세션이 존재한다면
        print(user_session_numb)
        print(type(user_session_numb))
        Sourcecode(
           user_code = text ,
           code_date = datetime.datetime.now() ,
           code_title = 'Bubble_sort' ,
           process_time= execution_time ,
           user_number = Member.objects.get(user_number = user_session_numb)
        ).save()
    print(text)
    print(trace)
    print(type(trace['code']))
    print(trace)
    print(type(trace['trace']))
    context = {
        'code' : trace['code'],
        'trace' : trace['trace']
    }
    return render(request, 'test2_h.html', context)