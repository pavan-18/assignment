
chmod 400 $PEMFILE


# Connect to dev server
ssh -i $PEMFILE  -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@$SERVER_IP << EOF

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 1234567890.dkr.ecr.us-east-1.amazonaws.com

# sudo -i
docker pull $CI_REGISTRY_IMAGE:"$CI_PIPELINE_ID"

# Download the image from registry and contenarize it
docker run -p 80:80  --name nginx -d $CI_REGISTRY_IMAGE:"$CI_PIPELINE_ID"
