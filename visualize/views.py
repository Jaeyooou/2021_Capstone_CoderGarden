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
    print('!!!!!!!!!!!!!!!!!!!!!!')
    out_s = StringIO.StringIO()
    print('out_s')
    print(out_s)

    def json_finalizer(input_code, output_trace):
        print('input_code')
        print(input_code)
        print('input+code type')
        print(type(input_code))
        print('output+trace')
        print(output_trace)
        print('output+trace type : ')
        print(type(output_trace))
        ret = dict(code=input_code, trace=output_trace)
        json_output = json.dumps(ret, indent=None)
        out_s.write(json_output)

    print(type(main_option))
    options = json.loads(main_json_option)
    print('-----request.puery.user_script----')
    print(main_text)
    print(main_json)
    print('----------------------------------')

    pg_logger.exec_script_str_local(main_text,
                                  main_json,
                                  options['cumulative_mode'],
                                  options['heap_primitives'],
                                  json_finalizer)

    return out_s.getvalue()