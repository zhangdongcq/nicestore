from django.apps import AppConfig


class UserOperationConfig(AppConfig):
    name = 'user_operation'
    verbose_name = "User Operation"

    def ready(self):
        import user_operation.signals
