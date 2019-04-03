from django.core.cache import cache
from rest_framework.authentication import BaseAuthentication

from app2.models import User


class UserAuthentication(BaseAuthentication):
    def authenticate(self, request):
        try:
            token = request.query_params.get('token')
            userid = cache.get(token)
            user = User.objects.get(pk = userid)
            return (user,token)
        except Exception as e:
            return None