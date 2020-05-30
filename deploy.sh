docker build -t dmaesj/multi-client:latest -t dmaesj/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t dmaesj/multi-server:latest -t dmaesj/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t dmaesj/multi-worker:latest -t dmaesj/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push dmaesj/multi-client:latest
docker push dmaesj/multi-server:latest
docker push dmaesj/multi-worker:latest
docker push dmaesj/multi-client:$SHA
docker push dmaesj/multi-server:$SHA
docker push dmaesj/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=dmaesj/multi-server:$SHA
kubectl set image deployments/client-deployment client=dmaesj/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=dmaesj/multi-worker:$SHA