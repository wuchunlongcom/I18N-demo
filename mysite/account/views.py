# -*- coding: utf-8 -*-
from django.shortcuts import render

def index(request):           
    #return render(request, 'test-i18n.html', context=locals()) 
    return render(request, 'account/index.html', context=locals()) 
   