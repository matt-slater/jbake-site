title=The Cloud Native Journey Part 1
date=2016-04-15
type=post
tags=blog, microservices, cloud, java, springboot
status=draft
~~~~~~

There's been a lot of buzz recently about "the cloud" and "cloud-native applications." What exactly do we mean when we talk about these apps? Do they live in the sky somewhere? The answer is *of course not*. Let me explain.

The way we develop software is going through some pretty radical changes. Software architecture is moving away from risky monolithic application structure and starting to move toward a decentralized distributed systems-type model. This distributed model consists of smaller applications or *microservices* that work together to solve the same problems or execute the same business logic that the outdated monolith solved.

The question then, is why introduce the complexity that comes with distributed systems? The advantage lies in the fact that each microservice is isolated, in effect, from the rest of the system, and that potentially radical changes to the service will not bring the entire system to a grinding halt. By trading off for a little complexity, we are able to gain *resiliency*. When we put one small team of developers in charge of the entire lifecycle of the service, we gain *agility*. The software can be put in to production much more quickly. When these services are deployed in a cloud environment (think any PaaS product Google App Engine, Cloud Foundry etc.), they gain *scalability*. Too many requests overwhelming your service? "Spin up" some more instances on the platform.

In this series of posts I will build a cloud-native application and document the process from start to production.

For my money, Spring

```java

@SpringBootApplication
class App {

  //this is a comment!
  public int i = 1;

  public static void main(String[] args) {
    i = foo(789);
    System.out.println("i is equal to " + i);
  }

  public static int foo(int i) {
    this.i += i;
    return i;
  }
}
```
