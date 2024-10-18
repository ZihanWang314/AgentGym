# if currently have any services, stop them
for port in $(seq 36001 36005); do
    # Check if there's a process using the port
    pid=$(lsof -t -i:$port)
    
    if [ -n "$pid" ]; then
        echo "Stopping process $pid using port $port..."
        # Kill the process using the port
        kill -9 $pid
        echo "Process on port $port has been stopped."
    else
        echo "No process found on port $port."
    fi
done

# Start the services
CONDA_HOME=/opt/conda
source ${CONDA_HOME}/etc/profile.d/conda.sh # initialize conda for non-interactive shell

conda activate agentenv-alfworld
pushd agentenv-alfworld
alfworld --host 0.0.0.0 --port 36001 &
popd

conda activate agentenv-babyai
pushd agentenv-babyai
babyai --host 0.0.0.0 --port 36002 &
popd

conda activate agentenv-sciworld
pushd agentenv-sciworld
sciworld --host 0.0.0.0 --port 36003 &
popd

conda activate agentenv-textcraft
pushd agentenv-textcraft
textcraft --host 0.0.0.0 --port 36004 &
popd

conda activate agentenv-lmrlgym
pushd agentenv-lmrlgym
lmrlgym --host 0.0.0.0 --port 36005 &
popd

# conda activate agentenv-webshop
# webshop --host 0.0.0.0 --port 36006

echo "All services have been started. Testing..."
sleep 5
curl http://localhost:36001
curl http://localhost:36002
curl http://localhost:36003
curl http://localhost:36004
curl http://localhost:36005
echo "All services tested"