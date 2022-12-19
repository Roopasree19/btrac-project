from django.urls import path
from . import views

urlpatterns = [
   path('',views.index),
   path('checkout/',views.checkout),
   path('codes/',views.codes),
   path('contact/',views.contact),
   path('electronics/',views.electronics),
   path('products/',views.products),
   path('single/',views.single),
   path('womens/',views.womens),
   path('register/',views.register),
   path('login/',views.login),
   path('logout/',views.logout),
   path('addcart/',views.addcart),
   path('updatecart/',views.updatecart),
   path('removecart/',views.removecart),
   path('downloadpdf/',views.downloadpdf),






   #################################################################
    path('admin_index/',views.admin_index),
    path('admin_register/',views.admin_register),
    path('admin_input/',views.admin_input),
    path('admin_validation/',views.admin_validation),
    path('admin_login/',views.admin_login),
    path('admin_logout/',views.admin_logout),
    path('admin_input/',views.admin_input),
    path('admin_shoes/',views.admin_shoes),
    path('admin_bags/',views.admin_bags),
    path('admin_sunglasses/',views.admin_sunglasses),
    path('admin_sweater/',views.admin_sweater),
    path('admin_table/',views.admin_table),
    path('admin_update/',views.admin_update),
    path('admin_delete/',views.admin_delete),
    path('admin_payment_table/',views.admin_payment_table),
    path('admin_order_table/',views.admin_order_table),
    path('admin_formtab/',views.admin_formtab),
    path('ajaxview/',views.ajaxview),
    
   ################################################################## 
    path('payment_index/',views.payment_index),
]
