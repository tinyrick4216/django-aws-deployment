from django.shortcuts import render,redirect
from .forms import MyForm


def home(request):
    form = MyForm(request.POST, request.FILES)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
        return redirect('/')
    return render(request, 'home.html', {"form":form})