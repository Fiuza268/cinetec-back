async function listMovies() {
    return await fetch('https://dummyapi.online/api/movies').then(async (response) => {
        if (response.status === 200) {
            return await response.json();
        }
    })
}

export { listMovies };