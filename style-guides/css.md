#CSS/LESS Style Guide

Some Python code :

```python
import random

class CardGame(object):
    """ a sample python class """
    NB_CARDS = 32
    def __init__(self, cards=5):
        self.cards = random.sample(range(self.NB_CARDS), 5)
        print 'ready to play'
```

Some Javascript code :

```js
var config = {
    duration: 5,
    comment: 'WTF'
}
// callbacks beauty un action
async_call('/path/to/api', function(json) {
    another_call(json, function(result2) {
        another_another_call(result2, function(result3) {
            another_another_another_call(result3, function(result4) {
                alert('And if all went well, i got my result :)');
            });
        });
    });
})
```
