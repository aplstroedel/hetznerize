// my functions
import { createServer, readServer, updateServer, deleteServer } from './crud/lib.js'

import Fastify from 'fastify'
const fastify = Fastify()

import formbody from '@fastify/formbody'
import multipart from '@fastify/multipart'

fastify.register(formbody)
fastify.register(multipart)

// Create
fastify.post('/create', async (req, rep)=>{
    let name = req.body.name
    let result = await createServer(name)
    rep.send(result)
})

// Read
fastify.post('/read', async (req, rep)=>{
    let name = req.body.name
    let result = await readServer(name)
    rep.send(result)
})

// Read all
fastify.post('/readall', async (req, rep)=>{
    let name = req.body.name ? req.body.name : ''
    let result = await readServer(name)
    rep.send(result)
})

// Update
fastify.post('/update', async (req, rep)=>{
    let id = req.body.old_name
    let name = req.body.new_name
    let result = await updateServer(await readServer(id),name)
    rep.send(result)
})

// Destroy
fastify.post('/delete', async (req, rep)=>{
    let name = req.body.name
    let result = await deleteServer(await readServer(name))
    rep.send(result)
})

fastify.listen({port: process.env.NODE_API_PORT, host: '0.0.0.0'})
