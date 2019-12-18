import unittest

class TestStringMethods(unittest.TestCase):

    def setUp(self):
        print('setUp...')
        self._text = 'foo'

    def tearDown(self):
        print('tearDown...')
        self._text = ''

    def test_upper(self):
        self.assertEqual('foo'.upper(), 'FOO')
    
    def test_isupper(self):
        self.assertTrue('FOO'.isupper())
        self.assertFalse('Foo'.isupper())

    def test_split(self):
        s = '台北醫學大學'
        result = ngram(s, 2)
        self.assertEqual(result[0], '台北')
        self.assertEqual(result[1], '北醫')
        self.assertEqual(result[2], '醫學')
        self.assertEqual(result[3], '學大')
        self.assertEqual(result[4], '大學')

        esult = ngram(s, 3)
        self.assertEqual(result[0], '台北醫')
        self.assertEqual(result[1], '北醫學')
        self.assertEqual(result[2], '醫學大')
        self.assertEqual(result[3], '學大學')

    def ngram(s, n):
        result = []
        return result

if __name__ == "__main__":
    unittest.main()

