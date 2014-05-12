import unittest
from jnius.reflect import autoclass

class ReflectTest(unittest.TestCase):

    def test_stack(self):
        Stack = autoclass('java.util.Stack')
        stack = Stack()
        self.assertIsInstance(stack, Stack)
        stack.push('hello')
        stack.push('world')
        self.assertEqual(stack.pop(), 'world')
        self.assertEqual(stack.pop(), 'hello')


class IterableConversion(unittest.TestCase):
    
    def test_should_wrap_java_iterable_as_python_iterable(self):
        
        SimpleIterable = autoclass('org.jnius.SimpleIterable')
        
        si = SimpleIterable()
        
        expected = list("hello", "world")
        actual = list(si.getIterable())
        
        self.assertEquals(expected, actual)