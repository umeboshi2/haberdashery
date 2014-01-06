from setuptools import setup, find_packages
import sys, os

version = '0.0'

requires = []

setup(name='haberdashery',
      version=version,
      description="javascript and css for web applications",
      long_description="""\
""",
      classifiers=[], # Get strings from http://pypi.python.org/pypi?%3Aaction=list_classifiers
      keywords='',
      author='Joseph Rawson',
      author_email='joseph.rawson.works@littledebian.org',
      url='https://github.com/umeboshi2/haberdashery',
      license='Public Domain',
      packages=find_packages(exclude=['ez_setup', 'examples', 'tests']),
      include_package_data=True,
      zip_safe=False,
      install_requires=requires,
      entry_points="""
      # -*- Entry points: -*-
      """,
      dependency_links=[
      'https://github.com/umeboshi2/fanstatic/archive/master.tar.gz#egg=fanstatic-1.0b2',
      'https://github.com/umeboshi2/js.deform/archive/deform2.tar.gz#egg=js.deform-0.9.8dev',
      'https://github.com/umeboshi2/js.ace/archive/master.tar.gz#egg=js.ace-1.1.1',
      'https://github.com/umeboshi2/js.jquery/archive/master.tar.gz#egg=js.jquery-2.0.3',
      ],
      )
