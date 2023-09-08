# Exposing Grafana with Emissary Ingress on Amazon EKS: A Step-by-Step Guide to Kubernetes Ingress Management | By M. Sharma

In the realm of Kubernetes and cloud-native applications, the secure and efficient management and exposure of services are of utmost importance. In this context, Ingress controllers play a pivotal role in directing external traffic to services within a cluster. While Nginx and Kong have long been established options, there's a new rising contender known as Emissary Ingress from Ambassador.io.
This article will guide you through the steps of installing Emissary Ingress on an Amazon EKS cluster and demonstrate its usage in exposing Grafana and Prometheus services.

Let's dive into detail about the importance of Ingress controllers and why Emissary Ingress is gaining prominence in the Kubernetes ecosystem:

## The Importance of Ingress Controllers:
In Kubernetes, an Ingress controller is a critical component for managing external access to services running within the cluster. It serves as an intelligent traffic management solution, allowing you to route external requests to the appropriate services, often based on factors such as domain names, paths, and other request attributes.

**Here are some key reasons why Ingress controllers are essential in Kubernetes:** </br>
- **Routing and Load Balancing:** Kubernetes clusters typically host multiple services, each with its own set of pods. Ingress controllers act as traffic routers, distributing incoming requests to the correct service and balancing the load across multiple pods within that service. This load balancing enhances application availability and performance.</br>
- **HTTP and HTTPS Termination:** Ingress controllers can handle SSL/TLS termination, allowing you to secure your services using HTTPS. They can also manage SSL certificates, simplifying the process of securing your applications.</br>
- **Path-Based Routing:** Ingress controllers support path-based routing, which means you can route requests to different services based on the URL paths. This is useful for hosting multiple applications or microservices behind a single load balancer.</br>
- **Host-Based Routing:** Ingress controllers enable host-based routing, allowing you to route requests to different services based on the hostnames in the HTTP request. This is particularly useful for hosting multiple domains or subdomains within the same cluster.</br>
Rewrites and Redirects: Ingress controllers can perform URL rewrites and redirects, which can be handy for handling legacy URLs, creating vanity URLs, or enforcing security policies.</br>
- **Authentication and Authorization:** Some Ingress controllers support authentication and authorization mechanisms, helping you secure your services by validating user identities and controlling access.</br>
- **Scalability:** Ingress controllers are designed to be highly available and scalable. They can handle a large volume of incoming traffic and adapt to changes in the cluster's service topology.

**References** 
[1]: https://github.com/Sharmio/infra-public/tree/main/aws/grafana-via-emissary
[2]: https://www.getambassador.io/products/api-gateway
[3]: https://www.youtube.com/channel/UCpSDw2Ih5oOKZBydoq_ptqQ
