import requests
import json

mURL = 'http://169.254.169.254/latest/meta-data/'


def mPULL(URL, arr):
    output = {}
    for i in arr:
        nURL = URL + i
        req = requests.get(nURL)
        text = req.text
        if i[-1] == "/":
            values = req.text.splitlines()
            output[i[:-1]] = mPULL(nURL, values)
        else:
            output[i] = text
    return output


def get_mJSON():
    initial = ["/"]
    result = mPULL(mURL, initial)
    mJSON = json.dumps(result, indent=2)
    return mJSON

if __name__ == '__main__':
    print(get_mJSON())