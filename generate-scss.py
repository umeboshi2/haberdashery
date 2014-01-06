import os, sys

jquery_ui_template = """\
@import "partials/basecolors/%(basecolor)s";
@import "partials/jq-ui-theme";
@include jquery-ui-base-theme;
"""

bootstrap_template = """\
@import "partials/basecolors/%(basecolor)s";
@import "partials/bootstrap-variables";
@import "partials/bootstrap-custom";
"""

screen_template = """\
@import "partials/basecolors/%(basecolor)s";
@import "partials/common-page";
@import "partials/list-styles";
// extra stuff
@import "partials/tickets";

// extra admin stuff
@import "partials/imagelist-admin";
@import "partials/userlist-admin";
@import "partials/grouplist-admin";
@import "partials/misc";
"""

TEMPLATES = dict(jqueryui=jquery_ui_template,
                 bootstrap=bootstrap_template,
                 screen=screen_template)


BASECOLORS = ['darkseagreen', 'light-plum', 'lightskyblue',
              'deep-pink', 'azure3', 'light-steel-blue',
              'white-smoke', 'darkkhaki', 'mistyrose3',
              'wheat4', 'easter']

def generate_scss(basecolor, name, template):
    filename = '%s-%s.scss' % (name, basecolor)
    path = os.path.join('sass', filename)
    env = dict(basecolor=basecolor)
    with file(path, 'w') as o:
        o.write(template % env)
        
        

def generate_all_scss(basecolors):
    for basecolor in basecolors:
        for name, template in TEMPLATES.items():
            generate_scss(basecolor, name, template)


if __name__ == '__main__':
    generate_all_scss(BASECOLORS)
    
    
    
