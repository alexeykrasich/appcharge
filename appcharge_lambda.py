import os
import json
import boto3
from slack_sdk import WebClient
from slack_sdk.errors import SlackApiError

# Set your Slack credentials and channel ID
slack_token = 'YOUR_SLACK_TOKEN'
slack_channel_id = 'YOUR_SLACK_CHANNEL_ID'

slack_client = WebClient(token=slack_token)

def lambda_handler(event, context):
    sqs_message = json.loads(event['Records'][0]['body'])
    log_message = sqs_message['Message']

    # Log the message to Slack
    log_to_slack(log_message)

    return {
        'statusCode': 200,
        'body': 'Log message processed successfully.'
    }

def log_to_slack(message):
    try:
        slack_client.chat_postMessage(
            channel= #slack_channel_id,
            text=f'New log message:\n```{message}```'
        )
        print("Message logged to Slack successfully.")
    except SlackApiError as e:
        print(f"Error logging message to Slack: {e.response['error']}") 
