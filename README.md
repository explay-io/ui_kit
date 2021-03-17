# change_library

Change custom toolkit for ui elements and reusable components

#Principles
Do not introduce spacing around the widget unless it is a part of the widget (i.e. TextButton). It is easier to just wrap it in padding during consumption.

# Workflow
After you merge your PR to master new git tag will be generated

During development you can add local version of this lib to changeapp by substituting dependency in `pubspec.yaml` from
```
  ui_kit:
    git:
      url: git://github.com/ChangeFinance/ui_kit.git
      ref: 0.0.8

```

to


```
  ui_kit:
    path: /Users/almeynman/code/change/ui_kit
```