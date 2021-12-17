from faker import Faker
faker = Faker()

def factory_thanos():

    return {
        "name": faker.name(),
        "aliases": "Thanos",
        "age": 3000,
        "team": "Ordem Negra",
        "active": False        
    }

def factory_deadpool():
    return {
        "name": "Wade Wilson",
        "aliases": "Deadpool",
        "age": 45,
        "team": "X-Force",
        "active": True        
    }