from flask import Flask, request
import boto3

app = Flask(__name__)

# AWS credentials and SQS queue URL
aws_access_key_id = 'AKIAZH5UNBVEYLF23VPB'
aws_secret_access_key = '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'
sqs_queue_url = 'https://sqs.eu-central-1.amazonaws.com/635496631625/FORECS-TEST_ALEX'

sqs = boto3.client('sqs', region_name='eu-central-1',
                   aws_access_key_id=aws_access_key_id,
                   aws_secret_access_key=aws_secret_access_key)

@app.route('/')
def index():
#    # Get the body of the request
#    request_body = request.data.decode('utf-8')

    # Send the body to SQS
    response = sqs.send_message(
        QueueUrl=sqs_queue_url,
        MessageBody='Appcharge!!!'
    )

    return 'Appcharge!!!', 200

#if __name__ == '__main__':
#    app.run(host='0.0.0.0', port=8000) 

if __name__ == '__main__':
    # Set FLASK_ENV to production
    app.config['ENV'] = 'production'
    
    # Run the app with --host=0.0.0.0 to allow external access
    app.run(host='0.0.0.0', port=8000, debug=False)
