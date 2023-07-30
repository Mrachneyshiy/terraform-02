# Домашнее задание к занятию «Основы Terraform. Yandex Cloud»

## Задача 1
В качестве ответа всегда полностью прикладываете ваш terraform-код в git!

1. Изучите проект. В файле variables.tf объявлены переменные для yandex provider.
2. Переименуйте файл personal.auto.tfvars_example в personal.auto.tfvars. Заполните переменные (идентификаторы облака, токен доступа). Благодаря .gitignore этот файл не попадет в публичный репозиторий. **Вы можете выбрать иной способ безопасно передать секретные данные в terraform.**
3. Сгенерируйте или используйте свой текущий ssh ключ. Запишите его открытую часть в переменную **vms_ssh_root_key**.
4. Инициализируйте проект, выполните код. Исправьте намеренное допущенные ошибки. Ответьте в чем заключается их суть?
5. Ответьте, как в процессе обучения могут пригодиться параметры```preemptible = true``` и ```core_fraction=5``` в параметрах ВМ? Ответ в документации Yandex cloud.

В качестве решения приложите:
- скриншот ЛК Yandex Cloud с созданной ВМ,
- скриншот успешного подключения к консоли ВМ через ssh(к OS ubuntu необходимо подключаться под пользователем ubuntu: "ssh ubuntu@vm_ip_address"),
- ответы на вопросы.

## Ответ:
1. В файл variables.tf внес свой текущий ssh ключ.

<details>
<summary>Часть кода в variables.tf:</summary>

```sh
###ssh vars
variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCwyJ3A7ejWrc8zrubKHU/QnVkCiQeREs7YqXNxpPLacXVRKBSEyC5D8nFQtUZcYCprLOKFXZqwmpUH5TVn0rONjZx1R1cvO9sa3lDm6DrpbIVQqGDYCJ+GerAtzYYDnL51z+daKrT9cqa2LdvTzEWfDyB7+gujFiJrGLnFA1pJeN1x6jHj/V7hXm0y88uW/G6AZWnGfvgJzUj5B7AMdRBjR3YGDTbnjcgnHLCNoO4nefHqMBiEZ7FibNqi1GqSi243GtBVNq8BMlHZyWucPG7IeUBHZ93gf9eLbN5nGx2E4TGZIcKjSH9QYptgXEi19HDE4wqYCexCNBTuwSN2YHWBD6B3MEnwKA2R1GtNM/rH69+puXZJx3p/qidSmQwQvdsVze4uJf4v+UEJvGbg06ce9VFjfoaiLFNLNKIVP1xqrZTHtWQeX9mqYZ3KrmNvzO843Eb9nqn5fyGDjkK600bAeg6tlB+jkFNu9PY28NLiasCfnRovBtvUm2esKqWQ/BE= skvorchenkov@localhost.localdomain"
  description = "ssh-keygen -t ed25519"
}
```   
</details>

------

<details>
<summary>Вывод консоли 1:</summary>

```sh
yandex_vpc_network.develop: Creating...
yandex_vpc_network.develop: Creation complete after 4s [id=enpk9ro8q59lbmjlf967]
yandex_vpc_subnet.develop: Creating...
yandex_vpc_subnet.develop: Creation complete after 2s [id=e9bs6molibhqfut364gt]
yandex_compute_instance.platform: Creating...
╷
│ Error: Error while requesting API to create instance: server-request-id = 1ef1dd75-0c76-4dda-966f-e55d5752104a server-trace-id = eea1811753ae64a7:98efc02e7303946f:eea1811753ae64a7:1 client-request-id = 5ac54b2e-8d2b-4194-8c2d-c5dcea85b15b client-trace-id = c0e91596-1972-4c4a-a8cc-5326bb337599 rpc error: code = FailedPrecondition desc = Platform "standart-v4" not found
│ 
│   with yandex_compute_instance.platform,
│   on main.tf line 15, in resource "yandex_compute_instance" "platform":
│   15: resource "yandex_compute_instance" "platform" {
```   
</details>

------

<details>
<summary>Вывод консоли 2:</summary>

```sh
yandex_compute_instance.platform: Creating...
╷
│ Error: Error while requesting API to create instance: server-request-id = 087fc86d-bdad-40e7-8982-556a48596ebe server-trace-id = f32711517defe631:15f03a5953f8d67d:f32711517defe631:1 client-request-id = d3012ef7-ed63-4f7f-8cb4-8b6b2979deaa client-trace-id = bd9be09b-b2fe-4eb4-a9fc-2381ee9d7206 rpc error: code = InvalidArgument desc = the specified number of cores is not available on platform "standard-v1"; allowed core number: 2, 4
│ 
│   with yandex_compute_instance.platform,
│   on main.tf line 15, in resource "yandex_compute_instance" "platform":
│   15: resource "yandex_compute_instance" "platform" {
│ 
╵
```   
</details>

------

1. В первом выводе консоли в main.tf была указана ошибка в написании standart-v4. Исправил на starndard-v1. Во втором выводе консоли указана ошибка с 1 ядром. Чтобы создать ВМ на Yandex Cloud необходимо иметь 2 ядра.
Исправленный кусочек кода в main.tf
<details>
<summary>Вывод консоли 2:</summary>

```sh
resource "yandex_compute_instance" "platform" {
  name        = "netology-develop-platform-web"
  platform_id = "standard-v1"
  resources {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }
```   
</details>

------

2. Ответы:
- preemptible = true создание ВМ с прерыванием. Она работает 24 часов и может быть остановлена Compute Cloud в любой момент. Может пригодиться если забыли удалить ресурсы на Yandex Cloud. Чтобы денги не тратились. 
- core_fraction указывает базовую производительность ядра в процентах. Гарантированная доля vCPU, которая будет выделена ВМ. ВМ с гарантированной долей меньше 100% обеспечивают указанный уровень производительности с вероятностью временного повышения вплоть до 100%. Эти ВМ подходят для задач, которые не требуют постоянной гарантии производительности vCPU на 100%.
3. Скриншот ЛК Yandex Cloud с созданной ВМ,

![](pic/1.png) 

4. Скриншот успешного подключения к консоли ВМ через ssh.

![](pic/2.png) 

## Задача 2
1. Изучите файлы проекта.
2. Замените все "хардкод" **значения** для ресурсов **yandex_compute_image** и **yandex_compute_instance** на **отдельные** переменные. К названиям переменных ВМ добавьте в начало префикс **vm_web_** .  Пример: **vm_web_name**.
2. Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их **default** прежними значениями из main.tf. 
3. Проверьте terraform plan (изменений быть не должно). 

## Ответ:
![](pic/3.png) 

## Задача 3
1. Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
2. Скопируйте блок ресурса и создайте с его помощью вторую ВМ(в файле main.tf): **"netology-develop-platform-db"** ,  cores  = 2, memory = 2, core_fraction = 20. Объявите ее переменные с префиксом **vm_db_** в том же файле('vms_platform.tf').
3. Примените изменения.

## Ответ:
![](pic/4.png) 

## Задача 4
1. Объявите в файле outputs.tf output типа map, содержащий { instance_name = external_ip } для каждой из ВМ.
2. Примените изменения.

В качестве решения приложите вывод значений ip-адресов команды ```terraform output```

## Ответ:
![](pic/5.png)

# Остальное все в коде проекта.