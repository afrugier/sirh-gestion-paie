package dev.paie.config.aspect;

import java.time.Duration;
import java.time.LocalDateTime;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import dev.paie.entite.Performance;
import dev.paie.repository.PerformanceRepository;

@Configuration
@Aspect
public class ControllerPerformanceAspect {
	private static final Logger LOGGER = LoggerFactory.getLogger(ControllerPerformanceAspect.class);
	@Autowired
	PerformanceRepository repoPerfo;

	@Around("execution(* dev.paie.web.controller.*.*(..))")
	public Object logPerf(ProceedingJoinPoint pjp) throws Throwable {
		LocalDateTime debutMetod = null;
		LocalDateTime finMethod = null;

		LOGGER.debug("Début d'exécution de la méthode " + pjp.getSignature().toString());
		debutMetod = LocalDateTime.now();
		Object resultat = pjp.proceed();
		LOGGER.debug("Fin d'exécution de la méthode");
		finMethod = LocalDateTime.now();
		long duration = Duration.between(debutMetod, finMethod).toMillis();

		repoPerfo.save(new Performance(pjp.getSignature().getName(), debutMetod, duration));

		return resultat;
	}
}