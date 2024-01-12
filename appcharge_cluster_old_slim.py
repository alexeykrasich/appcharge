from flask import Flask, request
import boto3

app = Flask(__name__)

# AWS credentials and SQS queue URL
aws_access_key_id = 'AKIAZH5UNBVEYLF23VPB'
aws_secret_access_key = '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'
sqs_queue_url = ''

sqs = boto3.client('sqs', region_name='eu-central-1',
                   aws_access_key_id=aws_access_key_id,
                   aws_secret_access_key=aws_secret_access_key)

@app.route('/')
def index():
    # Get the body of the request
    request_body = request.data.decode('utf-8')

    # Send the body to SQS
    response = sqs.send_message(
        QueueUrl=sqs_queue_url,
        MessageBody=request_body
    )

    return 'Appcharge!!!', 200

if __name__ == '__main__':
    app.run(debug=True) 
