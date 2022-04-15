



# Prometheus  


     

The Role of Exporters

Prometheus is a time-series database with a UI and sophisticated querying language (PromQL). Prometheus can scrape metrics, counters, gauges and histograms over HTTP using plaintext or a more efficient protocol.

Glossary:

When the /metrics endpoint is embedded within an existing application it's referred to as instrumentation and when the /metrics endpoint is part of a stand-alone process the project call that an Exporter.


Node exporter

One of the most widely used exporters is the NodeExporter. When NodeExporter is run on a host it will provide details on I/O, memory, disk and CPU pressure. You can run the NodeExporter as a Docker container, but it needs so many additional flags that the project recommends you run it directly on a host being monitored.

The built-in exporter

Prometheus provides its own set of metrics - in effect dog-fooding. This is built-in and is usually configured to be scraped (or collected) by default.

Community-supported exporters

An interesting exporter that was put together around Docker's Berlin summit is the Docker Hub and Github exporter by Edward Marshall. These exporters surface metrics from the Docker Hub or Github sites by querying APIs periodically and then relaying the values.


Docker Hub exporter written in Python

Bitcoin mining exporter in Node.js

## Building your own exporter

This is where things get really interesting - you can monitor almost anything. Imagine you ran a Shopify store (think: webstore-in-a-box) tracking both sales and order status.

Here are a few ideas for metrics you could include on a dashboard:

    top selling product
    top selling category
    total orders placed over time
    response time between placing and shipping an order
    total reviews
    average "star" rating on reviews
    how many sign-ups you've had

Now you may find that this kind of data is already available in which case maybe you just want to track lower-level metrics:

    database transactions processed
    payment gateway response time
    HTTP errors such as 403 and 404
    Geo-location of customers by IP address.

Let's first look at a simple Prometheus recipe with Docker and then come back to writing our own instrumentation for a sample app.


Instrumenting an application

So let's look at instrumenting your own application.

There are two approaches to instrumentation, but both involve you exposing or implementing a HTTP/s endpoint. By default the endpoint is /metrics but can be configured in your prometheus.yml file. Prometheus will use this endpoint to scrape metrics at regular intervals such as every 5s or 30s.

Should I alter my application code?

You can make the /metrics endpoint part of your existing application's code. This means you already have the requisite secrets and credentials to interact with the your business/payment or database tiers. The downside is that you need to include a new library, endpoint and dependency into your product or project.

What is the other option?

It is also possible to write a separate process that acts as a shim to expose information from your application or environment. In the case of Ed's Docker Hub exporter he collates data from an external API which he has no control over. So if you're finding it hard to get approval to alter an existing application then this could be the way to go.

An advantage of a separate process is that you can update what you monitor without having to re-deploy your own application(s).







Instrument a Golang application

Let's create a simple application and instrument it directly with the Golang Prometheus library.

Use case:

We've been asked to write a web-service to provide SHA-256 hashes on demand, we want to know several things:

    How many requests we get for hashes
    How long each hash takes to compute on average
    How many 400 (bad request) errors we get


[https://github.com/alexellis/hash-browns](https://github.com/alexellis/hash-browns)  







# Links  


[https://prometheus.io/docs/instrumenting/writing_exporters/](https://prometheus.io/docs/instrumenting/writing_exporters/)  
[https://prometheus.io/docs/instrumenting/exporters/](https://prometheus.io/docs/instrumenting/exporters/)  
[https://medium.com/teamzerolabs/15-steps-to-write-an-application-prometheus-exporter-in-go-9746b4520e26](https://medium.com/teamzerolabs/15-steps-to-write-an-application-prometheus-exporter-in-go-9746b4520e26)  
[https://www.infoq.com/articles/prometheus-monitor-applications-at-scale/](https://www.infoq.com/articles/prometheus-monitor-applications-at-scale/)  
[https://github.com/instaclustr/AnomaliaMachina](https://github.com/instaclustr/AnomaliaMachina)  
[https://blog.alexellis.io/prometheus-monitoring/](https://blog.alexellis.io/prometheus-monitoring/)  
[https://github.com/alexellis/hash-browns](https://github.com/alexellis/hash-browns)  
[https://levelup.gitconnected.com/building-a-prometheus-exporter-8a4bbc3825f5](https://levelup.gitconnected.com/building-a-prometheus-exporter-8a4bbc3825f5)  

